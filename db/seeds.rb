company = Company.create(
  name: 'Devenue'
)

company.users.create(
  name: 'Rio Yoshida',
  email: 'rio.yoshida@devenues.com',
)

layout = nil
%w[cerulean flatly lumen sketchy united].each do |style|
  layout = company.layouts.create(
    title: style.capitalize,
    content: '<!DOCTYPE html><html lang="en"><meta charset="utf-8"><title>Bootswatch: Flatly</title><meta name="viewport" content="width=device-width, initial-scale=1"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/' + style + '/bootstrap.min.css"><div class="navbar navbar-expand-lg navbar-dark bg-primary"><div class="container"><a href="#" class="navbar-brand">' + style.capitalize + '</a> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button><div class="collapse navbar-collapse" id="navbarResponsive"><ul class="navbar-nav"><li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Themes</a><div class="dropdown-menu" aria-labelledby="themes"> <a class="dropdown-item" href="#">Default</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">Cerulean</a> <a class="dropdown-item" href="#">Cosmo</a> <a class="dropdown-item" href="#">Cyborg</a> <a class="dropdown-item" href="#">Darkly</a> <a class="dropdown-item" href="#">Flatly</a> <a class="dropdown-item" href="#">Journal</a> <a class="dropdown-item" href="#">Litera</a> <a class="dropdown-item" href="#">Lumen</a> <a class="dropdown-item" href="#">Lux</a> <a class="dropdown-item" href="#">Materia</a> <a class="dropdown-item" href="#">Minty</a> <a class="dropdown-item" href="#">Morph</a> <a class="dropdown-item" href="#">Pulse</a> <a class="dropdown-item" href="#">Quartz</a> <a class="dropdown-item" href="#">Sandstone</a> <a class="dropdown-item" href="#">Simplex</a> <a class="dropdown-item" href="#">Sketchy</a> <a class="dropdown-item" href="#">Slate</a> <a class="dropdown-item" href="#">Solar</a> <a class="dropdown-item" href="#">Spacelab</a> <a class="dropdown-item" href="#">Superhero</a> <a class="dropdown-item" href="#">United</a> <a class="dropdown-item" href="#">Vapor</a> <a class="dropdown-item" href="#">Yeti</a> <a class="dropdown-item" href="#">Zephyr</a></div><li class="nav-item"><a class="nav-link" href="#">Help</a><li class="nav-item"><a class="nav-link" href="#">Blog</a><li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Flatly</a><div class="dropdown-menu" aria-labelledby="download"> <a class="dropdown-item" rel="noopener" target="_blank" href="#">Open in JSFiddle</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">bootstrap.min.css</a> <a class="dropdown-item" href="#">bootstrap.css</a><div class="dropdown-divider"></div><a class="dropdown-item" href="#">_variables.scss</a> <a class="dropdown-item" href="#">_bootswatch.scss</a></div></ul><ul class="navbar-nav ms-md-auto"><li class="nav-item"><a target="_blank" rel="noopener" class="nav-link" href="#">GitHub</a><li class="nav-item"><a target="_blank" rel="noopener" class="nav-link" href="#">Twitter</a></ul></div></div></div><div class="container mt-5"><%= content %></div>',
  )
end

design = layout.designs.create(
  company_id: company.id,
  title: 'Sample design',
  content: '<h1 class="mb-5 text-success"><%= title %></h1><div class="row"><div class="col-4"><img src="<%= image %>" style="max-width:100%"></div><div class="col-8"><h4 class="mb-4"><%= subtitle %></h4><p><%= content %></div></div>',
)

design.pages.create(
  company_id: company.id,
  title: 'Awesome!!',
  content: '{"image": "https://p.w3layouts.com/demos/agronomy/web/images/img9.jpg","subtitle": "Vestibulum interdum mi sit amet augue vestibulum","content": "Lorem ipsum dolor sit t, consectetuer adipiscing elit. Praesentstibulum molestie lacus. Aenean nonumy hendrerit mauris. Phasellus porta. Fusce cipit varius mi. Cum sociis natoque penatibus et dis parturient montes, nasus. Nulla dui. Fusce feugiat malesuada odio.\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam lacus lorem, dignissim nec tempus et, convallis sit amet tellus. Vivamus ac faucibus metus, vitae facilisis elit. In et dolor id nibh luctus finibus non in sapien. Pellentesque ac leo iaculis, ultrices ex at, faucibus dolor. Vestibulum interdum mi sit amet augue vestibulum pharetra.\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam lacus lorem, dignissim nec tempus et, convallis sit amet tellus. Vivamus ac faucibus metus, vitae facilisis elit. In et dolor id nibh luctus finibus non in sapien."}',
)

design.pages.create(
  company_id: company.id,
  title: 'What the fuck!',
  content: '{"image": "https://p.w3layouts.com/demos/agronomy/web/images/img10.jpg","subtitle": "Vestibulum interdum mi sit amet augue vestibulum","content": "Lorem ipsum dolor sit t, consectetuer adipiscing elit. Praesentstibulum molestie lacus. Aenean nonumy hendrerit mauris. Phasellus porta. Fusce cipit varius mi. Cum sociis natoque penatibus et dis parturient montes, nasus. Nulla dui. Fusce feugiat malesuada odio.\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam lacus lorem, dignissim nec tempus et, convallis sit amet tellus. Vivamus ac faucibus metus, vitae facilisis elit. In et dolor id nibh luctus finibus non in sapien. Pellentesque ac leo iaculis, ultrices ex at, faucibus dolor. Vestibulum interdum mi sit amet augue vestibulum pharetra.\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam lacus lorem, dignissim nec tempus et, convallis sit amet tellus. Vivamus ac faucibus metus, vitae facilisis elit. In et dolor id nibh luctus finibus non in sapien."}',
)
