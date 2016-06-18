with trio as(
select 
pc."%voix/exp2"+(-1 * (pa."%voix/exp2"-pb."%voix/exp2"))as v2,
pc."%voix/exp3"+(-1 * (pa."%voix/exp3"-pb."%voix/exp3"))as v3,
pc."%voix/exp4"+(-1 * (pa."%voix/exp4"-pb."%voix/exp4"))as v4,
pc."%voix/exp8"+(-1 * (pa."%voix/exp8"-pb."%voix/exp8"))as v8,
pc."%voix/exp9"+(-1 * (pa."%voix/exp9"-pb."%voix/exp9"))as v9,
pc."%voix/exp10"+(-1 * (pa."%voix/exp10"-pb."%voix/exp10"))as v10,
pa.id as a, pb.id as b, pc.id as c
from 
departmentst1_2012_lessvotes_copy_type_1 as pa,
departmentst1_2012_lessvotes_copy_type_1 as pb,
departmentst1_2012_lessvotes_copy_type_1 as pc
where pa.id<pb.id and pa.id=2
) 
select tr.a,tr.b,tr.c,d.id
from 
departmentst1_2012_lessvotes_copy_type_1 as d,
trio as tr
where
d.id>tr.c  and
not(tr.a=tr.c and tr.b = d.id)
and
(d."%voix/exp2" between tr.v2-0.1 and tr.v2+0.1) and
(d."%voix/exp3" between tr.v3-0.1 and tr.v3+0.1) and
(d."%voix/exp4" between tr.v4-0.1 and tr.v4+0.1) and
(d."%voix/exp8" between tr.v8-0.1 and tr.v8+0.1) and
(d."%voix/exp9" between tr.v9-0.1 and tr.v9+0.1) and
(d."%voix/exp10" between tr.v10-0.1 and tr.v10+0.1)