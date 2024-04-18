alias RmqSteams.{MyProducer, MyConsumer}

publish_1m = fn msg ->
  :timer.tc(fn ->
    for n <- 1..1_000_000 do
      MyProducer.publish("#{n} - #{msg}")
    end
  end)
end

publish_10m = fn msg ->
  :timer.tc(fn ->
    for n <- 1..10_000_000 do
      MyProducer.publish("#{n} - #{msg}")
    end
  end)
end

publish_20m = fn msg ->
  :timer.tc(fn ->
    for n <- 1..20_000_000 do
      MyProducer.publish("#{n} - #{msg}")
    end
  end)
end

launch_consumers = fn number ->
  for _n <- 1..number do
    DynamicSupervisor.start_child(RmqSteams.DynamicSupervisor, {RmqSteams.MyConsumer, []})
  end
end
