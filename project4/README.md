# Project 4

### Serverless Data Engineering Pipeline

- Reproduce the architecture of the example serverless data engineering project or perform something similar using only serverless technologies
- Enhance the project by extending the functionality of the NLP analysis: adding entity extraction, key phrase extraction, or some other NLP feature or doing Applied Computer Vision.

Reference: https://github.com/noahgift/awslambda



# AWS Architecture Diagram

- The "Event Trigger" triggers the "Lambda Function Producer."
- The "Lambda Function Producer" reads sentences from "DynamoDB Table 1" and puts them into the "SQS Queue."
- The "SQS Queue" triggers the "Lambda Function Consumer."
- The "Lambda Function Consumer" performs sentiment analysis on the sentences and puts the results into "DynamoDB Table 2."

```dsaf as
# AWS Architecture Diagram

┌───────────────┐            ┌─────────────────────────┐
│ Event Trigger │────Trigger─┤    Lambda Function      │
│               │            │         Producer        │
└───────────────┘            └─────────┬───────────────┘
                                       │
                                       │ Reads sentences
                                       │ from DynamoDB
                                       ↓
                              ┌────────────────────┐
                              │      DynamoDB      │
                              │       Table 1      │
                              └─────────┬──────────┘
                                        │
                                        │ Puts sentences
                                        │ into SQS Queue
                                        ↓
                              ┌────────────────────┐
                              │        SQS         │
                              │       Queue        │
                              └─────────┬──────────┘
                                        │
                                        │ Triggers Lambda
                                        │ Function Consumer
                                        ↓
                      ┌─────────────────────────┐
                      │    Lambda Function      │
                      │        Consumer         │
                      └─────────┬───────────────┘
                                │
                                │ Does sentiment
                                │ analysis and puts
                                │ results into
                                │ DynamoDB Table 2
                                ↓
                      ┌────────────────────┐
                      │      DynamoDB      │
                      │       Table 2      │
                      └────────────────────┘


```

