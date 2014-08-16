<%if get_current_user %>
<form action="/logout" method="post">
  <input type="submit" value="logout">

</form>
<% end %>

<h1>Match Page</h1>

<font color="red"><p><%= @preferences.age_range %></p></font>

 <font color="blue"> <p><%= @match %></p></font>