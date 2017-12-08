# AC-iOS Midprogram iOS Asessment

## Setup

1. Fork this repo.
1. Clone this repo to your laptop.
1. Work on the assessment as described below.
1. Commit your work.
1. Push it to your fork.
1. Create a pull request.
1. Submit your project to Canvas

## Objective

* Build a table view that loads and displays a list of the Elements, one per cell/row. Use a custom UITableViewCell subclass.  It should have 2 labels and one image.  The image should be a square pinned to the left of cell from the small images endpoint below.  The labels should be configured as below:

    ```
    Name
    Symbol(Number) Atomic Weight

    e.g.

    Sodium
    Na(11) 22.9897
    ```
    
    Load a thumbnail image on each row as described below under Endpoints > Images.  For full credit, use a custom tableViewCell to make the image more readable.
    
* Tapping a cell segues to a detail view that:
    * sets the title to the ```name``` of the element
    * shows the larger image 
    * and the following data:
        * symbol
        * number
        * weight
        * melting point
        * boiling point
        * discovery year (2 pts Extra credit)

    * has a button that, when pressed, selects this element as your favorite. This
    should be implemented by a POST to the ```favorites``` endpoint.


Try to format the detail view as much like an individual element on a traditional periodic table as you can. You **cannot** use the thumbnail image inside the detail view controller, you need to format it yourself.

Sample element: [https://sciencenotes.org/wp-content/uploads/2015/04/06-Carbon-Tile.png](https://sciencenotes.org/wp-content/uploads/2015/04/06-Carbon-Tile.png)

**Be sure to still include the image, melting and boiling points, which are part of the basic requirements.**   I'd recommend generating the traditional representation and then just putting the extra info outside of it.
## Endpoints

**Elements**

```
https://api.fieldbook.com/v1/5a29757f9b3fec0300e1a68c/elements
```

This is a public read-only GET endpoint so no authentication is necessary.

**Images**

```
Thumbnail (for table view): http://www.theodoregray.com/periodictable/Tiles/ElementNumberWithThreeDigits/s7.JPG
Example: http://www.theodoregray.com/periodictable/Tiles/018/s7.JPG

Full-size: (for detail view): http://images-of-elements.com/lowercasedElementName.jpg
Example: http://images-of-elements.com/argon.jpg
```

Use the file naming convention illustrated here to generate urls for images.

These are both http urls, so you will need change your info.plist to [allow arbitrary loads](https://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http).

No full size images are available for atomic numbers 90 and up.

**Favorites**

```
https://api.fieldbook.com/v1/5a29757f9b3fec0300e1a68c/favorites
```

This endpoint expects JSON with the following two keys: "name" and "favorite_element".
Values should be your own name, and the symbol of the element currently displayed by the detail page, respectively.

The endpoint for your POST request uses Basic Auth with the following credentials:

- Username: key-1
- Password: ptJP0XOFIQ_xysF7nwoB


## JSON Info

Elements looks like this:

```javascript
    {
    "id": 1,
    "record_url": "https://fieldbook.com/records/5848deac37802c0400b17c6b",
    "number": 1,
    "weight": 1.0079,
    "name": "Hydrogen",
    "symbol": "H",
    "melting_c": -259,
    "boiling_c": -253,
    "density": 0.09,
    "crust_percent": 0.14,
    "discovery_year": "1776",
    "group": 1,
    "electrons": "1s1",
    "ion_energy": 13.5984
    },
    {
    "id": 109,
    "record_url": "https://fieldbook.com/records/5848dead37802c0400b17cd7",
    "number": 109,
    "weight": 268,
    "name": "Meitnerium",
    "symbol": "Mt",
    "melting_c": null,
    "boiling_c": null,
    "density": null,
    "crust_percent": null,
    "discovery_year": "1982",
    "group": 9,
    "electrons": null,
    "ion_energy": null
    }
```

Note the types of the variables and how many keys in the second example have null values. You should process the JSON data into your object in such a way that those fields are allowed to be null, and that the object is still instantiated.


# References

The resources found inside of [Unit Two Projects](https://github.com/C4Q/AC-iOS/blob/master/resources/unit2Projects.md) and [Unit Three Projects](https://github.com/C4Q/AC-iOS/blob/master/resources/Unit3Projects.md) will be helpful.


# Rubric

Criteria | Points
:---|:---
App uses AutoLayout correctly for all iPhones in portrait | 8 Points
Variable Naming and Readability | 4 Points
App uses MVC Design Patterns | 4 Points
Elements model is built correctly and handles nils appropriately | 4 points
Elements are loaded into the tableview using a custom table view cell | 4 points
Thumbnail images are loaded into the tableview without flickering | 4 points
Detail view controller loads the element in correctly | 4 points
Detail view controller loads the large image appropriately | 4 points
Detail view controller button makes a Post request to Fieldbook | 4 points


A total of 40 points, with 2 points extra credit.
