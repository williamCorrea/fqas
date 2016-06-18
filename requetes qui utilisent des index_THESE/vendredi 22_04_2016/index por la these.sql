--create index vector_elems on "adbis_clusterTable_grille"(elem1,elem2);
--create index minim on "result_Cluster_Grille_minDist"(cl1,cl2,"minDist");
--create index attri_vals on "adbis_clusterTable_grille"(id,v2,v3,v4,v8,v9,v10);
--create index cluster_centers on "result_Cluster_Grille_centres"("idCluster",v2,v3,v4,v8,v9,v10);
--create index cluster_centers_2 on "result_Cluster_Grille_centres"(v2,v3,v4,v8,v9,v10);
--create index bjf_tudos on departmentst1_2012_lessvotes
--("%voix/exp2","%voix/exp3","%voix/exp4","%voix/exp8","%voix/exp9","%voix/exp10")
--drop index bjf_tudos;
drop index vector_elems;
drop index minim;
drop index attri_vals;
drop index cluster_centers;
drop index cluster_centers_2;