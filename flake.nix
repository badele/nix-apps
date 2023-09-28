{
  description = "Nix applications packages";
  outputs = { self }: {
    defaultTemplate = self.templates.minimal;
    templates = {
      minimal = {
        path = ./projects/minimal;
        description = "minimal project";
      };
      scala = {
        path = ./projects/scala;
        description = "scala project";
      };
      deno = {
        path = ./projects/deno;
        description = "deno project";
      };
    };
  };
}
