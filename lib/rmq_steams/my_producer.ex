defmodule RmqSteams.MyProducer do
  use RabbitMQStream.Producer,
    stream_name: "my_stream",
    connection: RmqSteams.MyConnection
end
