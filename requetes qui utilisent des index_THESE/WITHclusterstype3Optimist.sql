with cl as(
select * from "adbis_clusterTable"
where  ("elem1"=5 and "elem2"=23)
),
cl2 as (
select "cl1" 
from "adbis_MinDist",
cl
where "minDist"<=4 and "cl2"=cl."id"
union
select "cl2" 
from "adbis_MinDist",
cl
where "minDist"<=4 and "cl1"=cl."id"
)
select v1.id, v2.vector
from 
"departmentst1_2012_less_vector" as v1,
"adbis_clusterTable" as v2,
"departmentst1_2012_less_vector" as vv2,
cl 
where 
v1.id=cl.vector and
v2."id"=cl."id" 
and 
v2."vector"<>cl."vector" 
and
vv2.id=v2.vector
--and
--abs(v1."%voix/exp2"-vv2."%voix/exp2")<=1
--and 
--abs(v1."%voix/exp3"-vv2."%voix/exp3")<=1
--and
--abs(v1."%voix/exp4"-vv2."%voix/exp4")<=1
--and
--abs(v1."%voix/exp8"-vv2."%voix/exp8")<=1
--and
--abs(v1."%voix/exp9"-vv2."%voix/exp9")<=1
--and
--abs(v1."%voix/exp10"-vv2."%voix/exp10")<=1
union 
select v3.id, v4.vector
from
"departmentst1_2012_less_vector" as v3,
"adbis_clusterTable" as v4,
"departmentst1_2012_less_vector" as vv4,
cl,
cl2
where 
v3.id=cl.vector
and
v4.id=cl2."cl1" and
vv4.id=v4.vector
and
abs(v3."%voix/exp2"-vv4."%voix/exp2")<=4
and 
abs(v3."%voix/exp3"-vv4."%voix/exp3")<=4
and
abs(v3."%voix/exp4"-vv4."%voix/exp4")<=4
and
abs(v3."%voix/exp8"-vv4."%voix/exp8")<=4
and
abs(v3."%voix/exp9"-vv4."%voix/exp9")<=4
and
abs(v3."%voix/exp10"-vv4."%voix/exp10")<=4

--select "maxDist" 
--from "adbis_MaxDist" as mm,
--cl
--where mm."idCluster" = cl."id""