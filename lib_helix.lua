--(c) Sylvain
--https://groups.google.com/forum/#!topic/icesl/cOc232CXyn0
--Modded by Maze:
--added error checking
--fixed the length check
--no longer 3d oriented, just standing as all other objects
--no longer emits the object, just returning as all functions


--
--function coil(od,id,rise,length)
--  od = outside diameter
--  id = inside diameter
--  rise
--  length
function coil(od,id,rise,length)
 --error handling and preparation
 if od<1 then od=1 end
 if id<0 then id=0 end
 if id>=od then id=0.98*od end
 if rise<0 then rise=od-id end
 local thickness = (od - id)/2
 local radius = od - thickness
 length = length - thickness
 if length<od then length=od end

 local i = 0
 local n = 64 -- increase for a smoother result
 local all={}
 local len = 0
 local prev
 while len + rise*i/n < length do
   --for i = 0,n,1 do
     local c = v(radius*cos(360*i/n),radius*sin(360*i/n),len + rise*i/n + thickness)
     if prev then
       table.insert(all,translate(prev)*sphere(thickness))
       table.insert(all,cylinder(thickness,prev,c))
     end
     prev = c
   --end
   
   i=i+1
   if i==n then 
     i=0
     len = len + rise
  end
 end
 table.insert(all,translate(prev)*sphere(thickness))
 return merge(all)
end

emit(coil(10,7,6,24))