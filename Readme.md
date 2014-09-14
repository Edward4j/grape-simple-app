# Simple Grape Example Web App

This is an example or a template if you will, for a web application based using Rack to provide
both a REST API using Ruby Grape and an HTML 5 front-end client (usually a single page app).

This project features a small framework (in `config.ru` and the files under `config/`) that sets up
the service using rackup (or anything else that can run Rack, if you configure it according to what
`config.ru` has to say).

## Usage

Just fork it or something, then checkout and add the implementation you need, as detailed below.

### Configuration

Configuration should be put into `environment.rb`. This is as simple as you get. `environment.rb` is
run just before the API classes are loaded.

### API Implementation

Implement your API by added ruby classes under the `api` directory. Each class should inherit from 
`Grape::API` and hosted in a separate file. The API in the file will be available under the uri 
`/api/<file base name>` with sub-directories fully supported - so the Grape call `:get` implemented
in the class `SampleClass` stored in `api/group/sample.rb` will be available in the URI 
`/api/group/sample/get`.

See the sample API in `api/hello.rb`. 

### Client Implementation

Client files should be stored under the `client` directory. When a browser tries to access the root of
the web app (the `/` uri), Rack's `try_static` will attempt to load the file `index.html`. additional
files can be loaded as needed (such as scripts or images) such that the "document directory" is `client`.

See the sample web page in `client/index.html`.
