project = "playground-s-11-b3e4982f"

region = "us-central1"

zone = "us-central-a"

credential = "playground-s-11-b3e4982f-342c5b787af8.json"


cloud-run-service-name = "dashboard-billapp"

port = 5000


image-name = "gcr.io/playground-s-11-b3e4982f/dashboard@sha256:e01c8940dfaa6166ecefea2b4dfc64a0f0d042c5cec35059da79e56d4c2d733d"

env-name = "DB_URL"

 env-value  = "mysql+pymysql://root:root@34.41.25.16:3306/dashboard"