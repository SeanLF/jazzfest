# Use direct uploads for Active Storage (remember to import "@rails/activestorage" in your application.js)
# pin "@rails/activestorage", to: "activestorage.esm.js"

# Use node modules from a JavaScript CDN by running ./bin/importmap

# pin "trix"
# pin "@rails/actiontext", to: "actiontext.js"
# pin "@rails/actioncable", to: "actioncable.esm.js"
# pin "@rails/activestorage", to: "activestorage.esm.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin "@hotwired/stimulus-importmap-autoloader", to: "stimulus-importmap-autoloader.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bulma/navbar", to: "bulma/navbar.js"
pin "bulma/notification", to: "bulma/notification.js"

pin "@hotwired/turbo-rails", to: "turbo.js"
pin "application"

# pin "bulma", to: "https://unpkg.com/bulma@0.9.3/css/bulma.css"

# pin "vue", to: "https://ga.jspm.io/npm:vue@2.6.14/dist/vue.runtime.esm.js"
