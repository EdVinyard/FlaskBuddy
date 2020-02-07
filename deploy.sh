ARGS="--cluster medici-nonprod \
    --region us-east-2 \
    --project-name blue \
    --file docker-compose.yml \
    --ecs-params ecs-params.yml"

## First time...
ecs-cli compose $ARGS service up
ecs-cli compose $ARGS service scale 2

## Updates
aws ecs update-service \
    --region us-east-2 \
    --cluster medici-nonprod \
    --service blue \
    --force-new-deployment
