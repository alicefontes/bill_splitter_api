# README

API for the bill splitter project.

Things you can request:
* Show the details of a specific item
* Edit a product
* Delete a product
* Include a new product
* Show a list of all products registered

This should respect the following:
* Show: GET /item/<id>
* List: GET /items
* New: POST /items
* Edit: PUT /item/<id>
* Delete: DELETE /item/<id>

A product needs to have specified price and quantity (useful if you are using the application alone), and may also have quantity and number of people sharing the product.

Product:
* id
* name
* price
* quantity
* number_of_people_sharing

Ruby version: 2.3.0
Rails version: 5.0.0
MongoDB shell version: 3.2.9

You can use the plugin "Advanced REST client" to make it easier to run the routes.
