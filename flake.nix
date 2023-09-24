{
  description = "Nix applications packages";
  outputs = { self }: {
    defaultTemplate = self.templates.minimal;
    templates = {
      minimal = {
        path = ./projects/minimal;
        description = "minimal project";
      };
    };
  };


}
