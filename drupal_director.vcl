director drupal round-robin {
	{
	        .backend = server1;
	}
	{
	        .backend = server2;
	}
}


backend drupal1 {
    .host = "10.0.25.53";
    .port = "80";
  	.probe=drupal_healthcheck;
}
backend drupal2{
    .host = "10.0.25.52";
    .port = "80";
  	.probe=drupal_healthcheck;
}

probe drupal_healthcheck {
  .url = "/";
  .timeout = 100ms;
  .interval = 10s;
  .window = 5;
  .threshold = 2;
}