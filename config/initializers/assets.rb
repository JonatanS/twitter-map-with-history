# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets
Rails.application.config.assets.version = '1.0'

##http://stackoverflow.com/questions/22970573/asset-filtered-out-and-will-not-be-served-add-config-assets-precompile
Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/,/.*\.png/]
#Rails.application.config.assets.precompile += %w( jquery-ui/ui-bg_flat_75_ffffff_40x100.png )
#Rails.application.config.assets.precompile += %w( jquery-ui/ui-bg_highlight-soft_75_cccccc_1x100.png )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
