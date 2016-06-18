--create index AAAattri_vals_Complet on "adbis_clusterTable_grille"(id,elem1,elem2,vector,v2,v3,v4,v8,v9,v10);
--create index AAAhashidVector on "adbis_clusterTable_grille" (id);
--create index AAAminimJustDist on "result_Cluster_Grille_minDist"("minDist");
--create index AAAvector_elems on "adbis_clusterTable_grille"(elem1,elem2);
--create index AAAminim on "result_Cluster_Grille_minDist"(cl1,cl2,"minDist");
--create index AAAattri_vals on "adbis_clusterTable_grille"(id,v2,v3,v4,v8,v9,v10);
--create index AAAcluster_centers on "result_Cluster_Grille_centres"("idCluster",v2,v3,v4,v8,v9,v10);
--create index AAAcluster_centers_2 on "result_Cluster_Grille_centres"(v2,v3,v4,v8,v9,v10);

--create index bjf_tudos on departmentst1_2012_lessvotes
--("%voix/exp2","%voix/exp3","%voix/exp4","%voix/exp8","%voix/exp9","%voix/exp10")

drop index AAAattri_vals_Complet;
drop index AAAhashidVector;
drop index AAAminimJustDist;
drop index AAAvector_elems;
drop index AAAminim;
drop index AAAattri_vals;
drop index AAAcluster_centers;
drop index AAAcluster_centers_2;

--drop index bjf_tudos;
--drop index vector_elems;
--drop index minim;
--drop index attri_vals;
--drop index cluster_centers;
--drop index cluster_centers_2;