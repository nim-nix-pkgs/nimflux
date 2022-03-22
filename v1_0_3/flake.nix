{
  description = ''InfluxDB client library.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimflux-v1_0_3.flake = false;
  inputs.src-nimflux-v1_0_3.ref   = "refs/tags/v1.0.3";
  inputs.src-nimflux-v1_0_3.owner = "tdely";
  inputs.src-nimflux-v1_0_3.repo  = "nimflux";
  inputs.src-nimflux-v1_0_3.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimflux-v1_0_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimflux-v1_0_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}