Phoenix.EndPoint.broadcast

```elixir
def broadcast(topic, event, msg) do
  Phoenix.Channel.Server.broadcast(pubsub_server!(), topic, event, msg)
end
```

Phoenix.Channel.Server.broadcast

```elixir
def broadcast(pubsub_server, topic, event, payload)
    when is_binary(topic) and is_binary(event) do
  broadcast = %Broadcast{
  topic: topic,
    event: event,
    payload: payload
  }

  PubSub.broadcast(pubsub_server, topic, broadcast, __MODULE__)
end
```
