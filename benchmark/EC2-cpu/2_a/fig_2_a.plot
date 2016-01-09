reset
set terminal  postscript enhanced color
set output "CPUSmall.ps"
set key box 
set key  above
set yrange[1:]
set ylabel "CPU Performance [Ubench score]"
set xlabel "Measurements per Hour"

set xtics ("Week 52" 168, "Week 53" 336, "Week 1" 504, "Week 2" 672, "Week 3" 840)
set parametric
set trange [1:140000]
va1 = 24
va2 = 48
va3 = 72
va4 = 96
va5 = 120
va6 = 144
va7 = 168
va8 = 192
va9 = 216
va10 = 240
va11 = 264
va12 = 288
va13 = 312
va14 = 336
va15 = 360
va16 = 384
va17 = 408
va18 = 432
va19 = 456
va20 = 480
va21 = 504
va22 = 528
va23 = 552
va24 = 576
va25 = 600
va26 = 624
va27 = 648
va28 = 672
va29 = 696
va30 = 720
va31 = 744
va32 = 768
va33 = 792
va34 = 816
va35 = 840
plot "cpuSmallUS.csv" using  10:4 title "US location", "cpuSmallEU.csv" using  10:4 title "EU location",\
     va1,t with lines lt 3 notitle, \
     va2,t with lines lt 3 notitle, \
     va3,t with lines lt 3 notitle, \
     va4,t with lines lt 3 notitle, \
     va5,t with lines lt 3 notitle, \
     va6,t with lines lt 3 notitle, \
     va7,t with lines lt 3 notitle, \
     va8,t with lines lt 3 notitle, \
     va9,t with lines lt 3 notitle, \
     va10,t with lines lt 3 notitle, \
     va11,t with lines lt 3 notitle, \
     va12,t with lines lt 3 notitle, \
     va13,t with lines lt 3 notitle, \
     va14,t with lines lt 3 notitle, \
     va15,t with lines lt 3 notitle, \
     va16,t with lines lt 3 notitle, \
     va17,t with lines lt 3 notitle, \
     va18,t with lines lt 3 notitle, \
     va19,t with lines lt 3 notitle, \
     va20,t with lines lt 3 notitle, \
     va21,t with lines lt 3 notitle, \
     va22,t with lines lt 3 notitle, \
     va23,t with lines lt 3 notitle, \
     va24,t with lines lt 3 notitle, \
     va25,t with lines lt 3 notitle, \
     va26,t with lines lt 3 notitle, \
     va27,t with lines lt 3 notitle, \
     va28,t with lines lt 3 notitle, \
     va29,t with lines lt 3 notitle, \
     va30,t with lines lt 3 notitle, \
     va31,t with lines lt 3 notitle, \
     va32,t with lines lt 3 notitle, \
     va33,t with lines lt 3 notitle, \
     va34,t with lines lt 3 notitle, \
     va35,t with lines lt 3 notitle;

