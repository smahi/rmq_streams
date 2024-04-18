defmodule RmqSteams.MyConsumer do
  use RabbitMQStream.Consumer,
    stream_name: "my_stream",
    connection: RmqSteams.MyConnection,
    initial_offset: :next

  require Logger

  @impl true
  def handle_message(message) do
    Logger.info("Handle message: #{message}")
    :ok
  end
end
