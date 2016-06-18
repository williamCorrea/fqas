explain analyze
with vector as (
select (pr.x-pp.x) as x,(pr.y-pp.y) as y
from 
syntec_points as pr,
syntec_points as pp
where pr.idpoint=4 and pp.idpoint=6)
select a.idpoint,b.idpoint
from 
syntec_points as a,
syntec_points as b,
vector as d
where
a.idpoint<>4 and b.idpoint<>6 and b.idpoint<a.idpoint 
 and
b.x between a.x+(select x from vector)-6 and a.x+(select x from vector)+6
and
b.y between a.y+(select y from vector)-6 and a.y+(select y from vector)+6

--explain with trio as (select a.idc,b.id,c.id,abs(a.gauche-b.gauche)as dif,c.gauche as gauch from
--presi_2012_vector as a,
--presi_2012_vector as b,
--presi_2012_vector as c ) 
--select presi_2012_vector.id from trio, presi_2012_vector where gauche between 2 and 4
--explain(select * from presi_2012_distance where gauche between 2 and 4)


 