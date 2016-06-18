explain analyze
with vector as (
select (pr.gauche-pp.gauche) as gauches,(pr.centre-pp.centre) as centres,(pr.droit-pp.droit) as droits
from 
regionst1_2012_position_trois_dimensions as pr,
regionst1_2012_position_trois_dimensions as pp
where pr.id=5 and pp.id=23)
select a.id,b.id
from 
regionst1_2012_position_trois_dimensions as a,
regionst1_2012_position_trois_dimensions as b,
vector as d
where
a.id<>23 and b.id<>5 and b.id<a.id 
 and
b.gauche between a.gauche+(select gauches from vector)-0.5 and a.gauche+(select gauches from vector)+0.5
and
b.centre between a.centre+(select centres from vector)-0.5 and a.centre+(select centres from vector)+0.5
and
b.droit between a.droit+(select droits from vector)-0.5 and a.droit+(select droits from vector)+0.5

--explain with trio as (select a.idc,b.id,c.id,abs(a.gauche-b.gauche)as dif,c.gauche as gauch from
--presi_2012_vector as a,
--presi_2012_vector as b,
--presi_2012_vector as c ) 
--select presi_2012_vector.id from trio, presi_2012_vector where gauche between 2 and 4
--explain(select * from presi_2012_distance where gauche between 2 and 4)


 