Please create a terraform directory that creates a GCP GKE Autopilot cluster in `us-central1`. For now, I would like it to use the minimum number of pods possible (no need for High Availability).

A tutorial is available here: https://docs.cloud.google.com/kubernetes-engine/docs/quickstarts/create-cluster-using-terraform  .
However, there might be more recent best practices not included in that tutorial.

The kubernetes cluster will host ArgoCD and Prefect Server, but we will deploy those later, not now.

Please also reveiw @CLAUDE.md .
