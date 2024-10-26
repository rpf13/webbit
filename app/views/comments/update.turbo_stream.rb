<%= turbo_stream.replace dom_id(@comment) do %>
  <%= render "comments/comment", comment: @comment %>
<% end %>

<%= turbo_stream.replace "#{dom_id(@submission)}_comments_form" do %>
  <%= render "comments/form", comment: Comment.new %>
<% end %>
