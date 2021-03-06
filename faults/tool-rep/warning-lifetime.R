#
# warning-lifetime.R,  5 Nov 19
#
# Data from:
# The Life and Death of Statically Detected Vulnerabilities: an Empirical Study
# Massimiliano Di Penta and Luigi Cerulo and Lerina Aversano
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG static-analysis mistake_lifetime mistake_fixed mistake_code-change

source("ESEUR_config.r")

library("survival")


plot_layout(2, 1)
pal_col=rainbow(2)


get_prog_hist=function(prog_str)
{
prog_hist=read.csv(paste0(ESEUR_dir, "faults/tool-rep/", prog_str), as.is=TRUE)

# Extract and order by SNAPSHOT so we can lookup TIMESTAMP
prog_hist=subset(prog_hist, TOOL == "Splint")
prog_hist=prog_hist[order(prog_hist$SNAPSHOT), ]

# Zero base and convert from seconds to days
prog_hist$TIMESTAMP=(prog_hist$TIMESTAMP-min(prog_hist$TIMESTAMP))/(60*60*24)

return(prog_hist)
}


plot_surv=function(df, tool_hist, prog_str, col_str)
{
max_end=max(tool_hist$TIMESTAMP)
df_event=!is.na(df$END)
df$START=tool_hist$TIMESTAMP[df$START]
df$END=tool_hist$TIMESTAMP[df$END]

df_surv=Surv(df$END-df$START, df_event)

df_mod=survfit(df_surv ~1)

plot(df_mod, col=col_str,
	yaxs="i",
	xlim=c(0, 1000),
	xlab="Days since created")
text(250, 0.92, prog_str, cex=1.3)
}

plot_categ=function(df, tool_hist, prog_str)
{
splint_mem=subset(df, CATEG == "Memory Problem")
splint_type=subset(df, CATEG == "Type Mismatch")

plot_surv(splint_mem, tool_hist, prog_str, pal_col[1])
par(new=TRUE)
plot_surv(splint_type, tool_hist, prog_str, pal_col[2])

legend(x="topright", legend=c("Memory problem", "Type mismatch"),
			bty="n", fill=pal_col, cex=1.3)
}


#  ID: the unique ID
#  FILE: the file where it was detected
#  LINE: the source line where it was detected
#  CATEG: the vulnerability category according to our classification
#  START: snapshot where the vulnerability appeared
#  END: snapshot where the vulnerability disappeared or was removed (NA if live at the last snapshot analyzed)
#  WASREM: 1 if the vulnerability was removed, 0 otherwise
#  WASREMBUG: 1 if the vulnerability was removed because of a bug fixing, 0 otherwise
#  DISAP: 1 if the vulnerability disappeared, 0 otherwise
#  DISAPBUG: 1 if the vulnerability disappeared because of a bug fixing, 0 otherwise
#  HOWDISAP: NA if the vulnerability did not disappear, CHG if it disappeared because of a change in the source code line, COCHG if it disappeared because of a co-change
#  LONGDESCR: long vulnerability description as printed by the detection tool
#  SYSTEM: analyzed system

splint_rep=read.csv(paste0(ESEUR_dir, "faults/tool-rep/splint.csv.xz"), as.is=TRUE)

# table(splint_rep$WASREMBUG)

# Remove cases where a mistake was fixed
splint_rep=subset(splint_rep, !WASREMBUG)

splint_samba=subset(splint_rep, SYSTEM == "samba")
splint_squid=subset(splint_rep, SYSTEM == "squid")

samba_hist=get_prog_hist("Samba-hist.csv.xz")
squid_hist=get_prog_hist("Squid-hist.csv.xz")

# plot_surv(splint_samba, samba_hist, pal_col[1])
# par(new=TRUE)
# plot_surv(splint_squid, squid_hist, pal_col[2])


plot_categ(splint_samba, samba_hist, "Samba\n")
plot_categ(splint_squid, squid_hist, "Squid\n")

