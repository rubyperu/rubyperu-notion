# README

## Commands

Agregar Devise

```
$ bundle add devise
$ rails generate devise:install
$ rails generate devise User email name password
```

Agregar modelos
```
$ rails g model Workspace owner:references title
$ rails g model Document workspace:references owner:references title content:rich_text
```

Documento pueda ser público o privado
```
$ rails g migration AddPublicToDocuments public:boolean
```