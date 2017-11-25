--
--torus(torus_r, tube_r, torus_seg, tube_seg)
--
--torus_r, rube_r     - radius
--torus_seg, tube_seg - segments
--
function torus(torus_r, tube_r, torus_seg, tube_seg)
  points = {}
  if torus_seg<3 then torus_seg=3 end
  if tube_seg<3 then tube_seg=3 end
  for i = 1,tube_seg do
    angle = i*math.pi*2/tube_seg
    point = v(torus_r,0) +
            v(tube_r*math.cos(angle),tube_r*math.sin(angle),0)
    table.insert(points,point)
  end
  return rotate_extrude(points, torus_seg)
end

if not pcall(getfenv, 4) then
  emit(translate(0,0, 0)*torus(50,5,180,180),0)
  emit(translate(0,0,10)*torus(50,5,180, 18),1)
  emit(translate(0,0,20)*torus(50,5, 18,180),2)
  emit(translate(0,0,30)*torus(50,5, 18, 18),3)
  emit(translate(0,0,40)*torus(50,5,  5,180),4)
  emit(translate(0,0,50)*torus(50,5,180,  5),5)
  set_brush_color(0,1,0,0)
  set_brush_color(1,0,1,0)
  set_brush_color(2,0,0,1)
  set_brush_color(3,1,1,0)
  set_brush_color(4,0,1,1)
  set_brush_color(5,1,0,1)
end

