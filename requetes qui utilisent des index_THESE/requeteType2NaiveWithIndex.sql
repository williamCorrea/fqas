explain analyze 
with tuple as(
select 
pr.gauche as gauche, 
pr.centre as centre,
pr.droit as droite
from
regionst1_2012_position_trois_dimensions  as pr
where pr.id=4
)
select a.id,b.id,c.id
from 
tuple,
regionst1_2012_position_trois_dimensions as a,
regionst1_2012_position_trois_dimensions as b,
regionst1_2012_position_trois_dimensions as c
where
--(a.id<>4 and c.id<>b.id) or
--(c.id>b.id and a.id>4) or(c.id<b.id and a.id<4) 
--and b.id<>4 and a.id<>c.id

--a.id<>4 
--and c.id>b.id 
--and

(c.gauche between b.gauche -( (select gauche from tuple) -a.gauche )-2 and b.gauche +((select gauche from tuple) -a.gauche )+2) and

(c.centre between b.centre -( (select centre from tuple) -a.centre )-2 and b.centre +((select centre from tuple) -a.centre )+2 ) and

(c.droit between b.droit -( (select droite from tuple) -a.droit )-2 and b.droit +((select droite from tuple) -a.droit )+2  )
 
order by a.id,b.id,c.id
--c.gauche between (a.gauche-b.gauche)-(select gauche from tuple)-2 and (a.gauche-b.gauche)+(select gauche from tuple)+2
--and
--c.centre between (a.centre-b.centre)-(select centre from tuple)-2 and (a.centre-b.centre)+(select centre from tuple)+2
--and
--c.droit between (a.droit-b.droit)-(select droite from tuple)-2 and (a.droit-b.droit)+(select droite from tuple)+2
--order by a.id

--explain with trio as (select a.id,b.id,c.id,abs(a.gauche-b.gauche)as dif,c.gauche as gauch from
--presi_2012_vector as a,
--presi_2012_vector as b,
--presi_2012_vector as c ) 
--select presi_2012_vector.id from trio, presi_2012_vector where gauche between 2 and 4
--explain(select * from presi_2012_distance where gauche between 2 and 4)
 