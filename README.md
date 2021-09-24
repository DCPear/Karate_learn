# Karate_learn
### Json
#### Json object notation
<p>Json object: {} - key is unique </p>

Simple object
```
{"key1":Value",
   "key2":Value"}
```

Nested object
```
{ 
  "key":{
      "nestedKey:" "nestedValue"
    }
}
```

Nested array
```
{ 
  "key":[
       "value1","value2"
   ]
}
```
Json array: []

```

["value1", "Value2"]
```
Array of objects
```
[
    {"key":"value1"},
    {"key":"value2"}
]
```
Data types
````
String  {"Greeting": "Hello"}
number  {"Age": 86}
Boolean {"isTrue": true, "isFalse": false}
Null {"pet": null}
````

####  Simple Karate syntax 
def anObject
````
define an object 
 def anObject
{
  "FirstName":"Joe",
  "LastName":"Bloggs",
  "Age":23,
  "Skills":["Java", "JavaScripts"],
  "WorkHistory":{
    "2000":"Trainee",
    "2010":"Specialist",
    "2020":"Manager"  
  },
  "Certifications":[
    {"Name":"Cert1",
      "Type": "Azure"
    },
    {"Name":"Cert2",
      "Type": "AWS"
    }
    ]
}
Get
get the lastName = anObject.lastName
get the second skill anObject.Skills[1]

     Note: use https://jsonpathfinder.com/
Update
set anObject.age = "25 " 
set anobject.Certifications[0].Name = "Az-900"

Add (Karate will add an new record)
set anObject.Skills[3] ="Node"

delete
remove anObject.WorkHistory.2020
````
