--A2212/13T 1000KV
if isempty(motor_a2212_1000kv) then 
motor_a2212_1000kv = difference { union { 
    cylinder(3.17/2, 40), --axle 
    translate(0,0,1.2)*cylinder(6/2,0.3), --axle lock ring 
    translate(0,0,1.5)*cone(24/2,27.8/2,5), --bottom 
    translate(0,0,1.5+5)*cylinder(15/2, 0.6), --space 
    translate(0,0,1.5+5+0.6)*cylinder(27.8/2, 16), --body 
    translate(0,0,1.5+5+0.6+16)*cone(27.8/2,17.5/2,25.6-16-0.6-5), --top 
    translate(0,0,1.5+5+0.6+16)*cone(9/2,9/2,27-16-0.6-5), --top 
  },--end of union 
  --bottom screws 
  translate( 16/2, 0,0)*cylinder(2.7/2,1.5+5), 
  translate(-16/2, 0,0)*cylinder(2.7/2,1.5+5), 
  translate( 0, 19/2,0)*cylinder(2.7/2,1.5+5), 
  translate( 0,-19/2,0)*cylinder(2.7/2,1.5+5), 
  --bottom space 
  translate( 12, 12,0)*cylinder(20/2,5.5), 
  translate( 12,-12,0)*cylinder(20/2,5.5), 
  translate(-12, 12,0)*cylinder(20/2,5.5), 
  translate(-12,-12,0)*cylinder(20/2,5.5), 
  --top space 
  translate( 10/2+6.75/2,0,23)*cylinder(6.75/2,5), 
  translate(-10/2-6.75/2,0,23)*cylinder(6.75/2,5), 
  translate(0, 10/2+6.75/2,23)*cylinder(6.75/2,5), 
  translate(0,-10/2-6.75/2,23)*cylinder(6.75/2,5), 
}
end