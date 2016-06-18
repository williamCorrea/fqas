with centre as(
select * from "result_Cluster_Grille_centres"
),
cl as (
select gr.id,gr.elem1,gr.elem2,gr.vector,gr.v2,gr.v3,gr.v4,
gr.v8,gr.v9,gr.v10 from "adbis_clusterTable_grille" as gr,centre as ct
where gr.id=ct."idCluster" 
),
clust_neigh as
(
select * from "result_Cluster_Grille_minDist"
where "minDist"<=0.8
)


select v1.vector, dos.vector  
from
 cl as v1, cl as dos 
where
v1.id=dos.id and
v1.vector <> dos.vector and
v1.elem1=2
and
v1.v2 between dos.v2-0.8 and dos.v2+0.8 and
v1.v3 between dos.v3-0.8 and dos.v3+0.8 and
v1.v4 between dos.v4-0.8 and dos.v4+0.8 and
v1.v8 between dos.v8-0.8 and dos.v8+0.8 and
v1.v9 between dos.v9-0.8 and dos.v9+0.8 and
v1.v10 between dos.v10-0.8 and dos.v10+0.8

union

--In this part of the query, I select all the tuples in analogical proportion
-- but belonging to different clusters

select neigh_1.vector,neigh_2.vector from "adbis_clusterTable_grille" as neigh_1, 
"adbis_clusterTable_grille" as neigh_2, clust_neigh
where 
(neigh_1.elem1=1 or neigh_2.elem1=1) and
(neigh_1.id = clust_neigh.cl1 and neigh_2.id=clust_neigh.cl2 )
and neigh_1.vector<> neigh_2.vector
and
neigh_1.v2 between neigh_2.v2-0.8 and neigh_2.v2+0.8 and
neigh_1.v3 between neigh_2.v3-0.8 and neigh_2.v3+0.8 and
neigh_1.v4 between neigh_2.v4-0.8 and neigh_2.v4+0.8 and
neigh_1.v8 between neigh_2.v8-0.8 and neigh_2.v8+0.8 and
neigh_1.v9 between neigh_2.v9-0.8 and neigh_2.v9+0.8 and
neigh_1.v10 between neigh_2.v10-0.8 and neigh_2.v10+0.8