# Enable Webhook
1. Install "multibranch scan webhook trigger" plugin  
    From dashboard --> manage jenkins --> manage plugins --> Available Plugins  
    Search for "Multibranch Scan webhook Trigger" plugin and install it. 

2. Go to multibranch pipeline job
     job --> configure --> Scan Multibranch Pipeline Triggers --> Scan Multibranch Pipeline Triggers  --> Scan by webhook   
     Trigger token: `<token_name>`

3. Add webhook to GitHub repository
   Github repo --> settings --> webhooks --> Add webhook  
   Payload URl: `<jenkins_IP>:8080/multibranch-webhook-trigger/invoke?token=<token_name>`  
   Content type: `application/json`  
   Which event would you like to trigger this webhook: `just the push event` 


Once it is enabled make changes to source to trigger the build. 

JENKINS_URL/multibranch-webhook-trigger/invoke?token=[Trigger token] 
http://52.91.128.83:8080/j05_Twitter_Trend_MultiBranch_Pipeline_job/invoke?token=dwp-webhook-token
http://52.91.128.83:8080/j05_twitter_trend_multibranch_pipeline_job/invoke?token=dwp-webhook-token

j05_Twitter_Trend_MultiBranch_Pipeline_job
j05_twitter_trend_multibranch_pipeline_job
