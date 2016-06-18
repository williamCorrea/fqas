with vector as (
select 
(pr."%voix/exp2"-pp."%voix/exp2") as v2,
(pr."%voix/exp3"-pp."%voix/exp3") as v3,
(pr."%voix/exp4"-pp."%voix/exp4") as v4,
(pr."%voix/exp8"-pp."%voix/exp8") as v8,
(pr."%voix/exp9"-pp."%voix/exp9") as v9,
(pr."%voix/exp10"-pp."%voix/exp10") as v10
from 
departmentst1_2012_lessvotes as pr,
departmentst1_2012_lessvotes as pp
where pr.id=2 and pp.id=8)
select a.id,b.id
from 
departmentst1_2012_lessvotes as a,
departmentst1_2012_lessvotes as b,
vector as d
where
(a.id<>2 and b.id<>8) and b.id<a.id 
 and
b."%voix/exp2" between a."%voix/exp2"+(select v2 from vector)-0.4 and a."%voix/exp2"+(select v2 from vector)+0.4
and
b."%voix/exp3" between a."%voix/exp3"+(select v3 from vector)-0.4 and a."%voix/exp3"+(select v3 from vector)+0.4
and
b."%voix/exp4" between a."%voix/exp4"+(select v4 from vector)-0.4 and a."%voix/exp4"+(select v4 from vector)+0.4
and
b."%voix/exp8" between a."%voix/exp8"+(select v8 from vector)-0.4 and a."%voix/exp8"+(select v8 from vector)+0.4
and
b."%voix/exp9" between a."%voix/exp9"+(select v9 from vector)-0.4 and a."%voix/exp9"+(select v9 from vector)+0.4
and
b."%voix/exp10" between a."%voix/exp10"+(select v10 from vector)-0.4   and a."%voix/exp10"+(select v10 from vector)+0.4