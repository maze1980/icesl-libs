--(c) Sylvain
--https://groups.google.com/forum/#!topic/icesl/cOc232CXyn0
--Modded by Maze:
--spiral


--
--function spiral(id,od,turns,wd)
--  id = inside diameter
--  od = outside diameter
--  turns
--  wd = wire diameter
function spiral(id,od,turns,thickness)
 --error handling and preparation
 if id<0 then id=0 end
 if od<1 then od=1 end
 if id>=od then id=0.98*od end
 if turns<=0 then turns=1 end
 if thickness<=0 then thickness=1 end
 thickness = thickness/2
 id = id + thickness
 od = od - thickness

 local i = 0
 local n = 64 -- increase for a smoother result
 local all={}
 local len = 0
 local prev

 --while len + rise*i/n < length do
 for i=0, 360*turns, 4 do
   local i0 = i/360/turns
   local i1 = (360*turns-i)/360/turns
   local radius = id*i1 + od*i0
   local c = v(radius*cos(i),radius*sin(i),0)
   if prev then
     table.insert(all,translate(prev)*sphere(thickness))
     table.insert(all,cylinder(thickness,prev,c))
   end
   prev = c
 end
 table.insert(all,translate(prev)*sphere(thickness))
 return merge(all)
end

if not pcall(getfenv, 4) then
  emit(spiral(4,10,1.5,1),1)
end

