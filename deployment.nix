let

  secrets = import ./secrets;

in {

  network.description = "nix-community infra";

  build01 =
    { resources, ... }:
    {
      imports = [
        ./build01/configuration.nix
      ];

      deployment.targetHost = "94.130.143.84";

      deployment.keys.buildkite-token = {
        text = secrets.buildkite-token;
        user = "buildkite-agent";
        permissions = "0600";
      };

      deployment.keys.buildkite-agent-key = {
        text = secrets.buildkite-agent-key;
        user = "buildkite-agent";
        permissions = "0600";
      };

      deployment.keys."buildkite-agent-key.pub" = {
        text = secrets."buildkite-agent-key.pub";
        user = "buildkite-agent";
        permissions = "0600";
      };

      deployment.keys.gitlab-runner-registration = {
        text = secrets.gitlab-runner-registration;
        user = "gitlab-runner";
        permissions = "0600";
      };

      deployment.keys.github-actions-nixpkgs-fmt-token = {
        text = secrets.github-actions-nixpkgs-fmt-token;
        user = "root";
        permissions = "0600";
      };

    };

}
