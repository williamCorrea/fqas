explain analyze
with trio as(
select 
pc.gauche+(-1 * (pa.gauche-pb.gauche))as gauche,
pc.centre+(-1 * (pa.centre-pb.centre))as centre,
pc.droit+(-1 * (pa.droit-pb.droit))as droit
from 
presi_2012_vector as pa,
presi_2012_vector as pb,
presi_2012_vector as pc
where (pa.id=12 and pb.id=2  and pc.id=23) 
)
select d.id
from 
presi_2012_vector as d,
trio as tr
where
(d.gauche between tr.gauche-0.5 and tr.gauche+0.5) and
(d.centre between tr.centre-0.5 and tr.centre+0.5) and
(d.droit between tr.droit-0.5 and tr.droit+0.5)
