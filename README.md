
## Custom Environment Variables

| NAME | Example Value |
|------|---------------|
| `GIT_REPO`            | `github.com/username/some-repo-here.git` |
| `GIT_BRANCH`          | `master` |
| `GIT_EMAIL`           | `email@example.com` |
| `GIT_NAME`            | `John Do` |
| `GIT_PERSONAL_TOKEN`  | `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` |
| `GIT_USERNAME`        | `YourUsernameHere` |
| `GIT_REPULL`          | `1` |


## More from the Official README

* `DD_HOSTNAME` set the hostname (write it in `datadog.conf`)
* `TAGS` set host tags. Add `-e TAGS=simple-tag-0,tag-key-1:tag-value-1` to use [simple-tag-0, tag-key-1:tag-value-1] as host tags.
* `EC2_TAGS` set EC2 host tags. Add `-e EC2_TAGS=yes` to use EC2 custom host tags. Requires an [IAM role](https://github.com/DataDog/dd-agent/wiki/Capturing-EC2-tags-at-startup) associated with the instance.
* `LOG_LEVEL` set logging verbosity (CRITICAL, ERROR, WARNING, INFO, DEBUG). Add `-e LOG_LEVEL=DEBUG` to turn logs to debug mode.
* `DD_LOGS_STDOUT`: set it to `yes` to send all logs to stdout and stderr, for them to be processed by Docker.
* `PROXY_HOST`, `PROXY_PORT`, `PROXY_USER` and `PROXY_PASSWORD` set the proxy configuration.
* `DD_URL` set the Datadog intake server to send Agent data to (used when [using an agent as a proxy](https://github.com/DataDog/dd-agent/wiki/Proxy-Configuration#using-the-agent-as-a-proxy) )
* `NON_LOCAL_TRAFFIC` configures the `non_local_traffic` option in the agent which enables or disables statsd reporting from **any** external ip. You may find this useful to report metrics from your other containers. See [network configuration](https://github.com/DataDog/dd-agent/wiki/Network-Traffic-and-Proxy-Configuration) for more details. This option is set to true by default in the image, and the `docker run` command we provide in the example above disables it. Remove the `-e NON_LOCAL_TRAFFIC=false` part to enable it back. **WARNING** if you allow non-local traffic, make sure your agent container is not accessible from the Internet or other untrusted networks as it would allow anyone to submit metrics to it.
* `SD_BACKEND`, `SD_CONFIG_BACKEND`, `SD_BACKEND_HOST`, `SD_BACKEND_PORT`, `SD_TEMPLATE_DIR`, `SD_CONSUL_TOKEN`, `SD_BACKEND_USER` and `SD_BACKEND_PASSWORD` configure Autodiscovery (previously known as Service Discovery):

   - `SD_BACKEND`: set to `docker` (the only supported backend) to enable Autodiscovery.
   - `SD_CONFIG_BACKEND`: set to `etcd`, `consul`, or `zk` to use one of these key-value stores as a template source.
   - `SD_BACKEND_HOST` and `SD_BACKEND_PORT`: configure the connection to the key-value template source.
   - `SD_TEMPLATE_DIR`: when using SD_CONFIG_BACKEND, set the path where the check configuration templates are located in the key-value store (default is `datadog/check_configs`)
   - `SD_CONSUL_TOKEN`: when using Consul as a template source and the Consul cluster requires authentication, set a token so the Datadog Agent can connect.
   - `SD_BACKEND_USER` and `SD_BACKEND_PASSWORD`: when using etcd as a template source and it requires authentication, set a user and password so the Datadog Agent can connect.

* `DD_APM_ENABLED` run the trace-agent along with the infrastructure agent, allowing the container to accept traces on 8126/tcp (**This option is NOT available on Alpine Images**)
* `DD_PROCESS_AGENT_ENABLED` run the [process-agent](https://docs.datadoghq.com/graphing/infrastructure/process/) along with the infrastructure agent, feeding data to the Live Process View and Live Containers View (**This option is NOT available on Alpine Images**)

* `DD_COLLECT_LABELS_AS_TAGS` Enables the collection of the listed labels as tags. Comma separated string, without spaces unless in quotes. Exemple: `-e DD_COLLECT_LABELS_AS_TAGS='com.docker.label.foo, com.docker.label.bar'` or `-e DD_COLLECT_LABELS_AS_TAGS=com.docker.label.foo,com.docker.label.bar`.

* `MAX_TRACES_PER_SECOND`: Specifies the maximum number of traces per second to sample for APM.  Set to `0` to disable this limit.

**Note:** Some of those have alternative names, but with the same impact: it is possible to use `DD_TAGS` instead of `TAGS`, `DD_LOG_LEVEL` instead of `LOG_LEVEL` and `DD_API_KEY` instead of `API_KEY`.