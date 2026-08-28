{
  programs.nixvim.plugins.ts-autotag = {
    enable = true;
    lazyLoad.settings.ft = [ "html" "vue" "tsx" "svelte" "astro" ];
    settings.opts = {
      enable_close = false;
      enable_close_on_slash = false;
      enable_rename = true;
    };
  };
}
