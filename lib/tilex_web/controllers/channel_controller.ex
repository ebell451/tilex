defmodule TilexWeb.ChannelController do
  use TilexWeb, :controller
  import Tilex.Pageable
  alias Tilex.Posts

  def show(conn, %{"name" => channel_name} = params) do
    page = robust_page(params)
    {posts, posts_count, channel} = Posts.by_channel(channel_name, page)

    render(
      conn,
      "show.html",
      posts: posts,
      posts_count: posts_count,
      channel: channel,
      page: page,
      random: false
    )
  end

  def random_by_channel(conn, %{"channel" => channel_name}) do
    {posts, posts_count, channel} = Posts.random_post_by_channel(channel_name)

    render(
      conn,
      "show.html",
      posts: posts,
      posts_count: posts_count,
      channel: channel,
      page: 1,
      random: true
    )
  end
end
