A new Flutter project.

## Getting Started

Setting flutter: https://docs.flutter.dev/get-started/install

Generate JSON serialization: "flutter pub run build_runner watch --delete-conflicting-outputs"

Format: "flutter format ."

## Coding Conventions
Order of code statements inside a class
   properties
   static properties
   non static properties
   injected properties (Repository, RoutingManager)
   state properties
   constructor or initState() function
   destructor or dispose() function
   overridden life circle functions (didChangeDependencies(), didUpdateWidget())
   build function (build(BuildContext context))
   other overridden functions
   public functions
   private functions
   static functions

## Class name
enum should end with Type (eg: HomeContentType)
model should end with Model (eg: UserModel)
screen should end with Screen (eg: SearchScreen)
extension should be formed with format: Name of extended class + Feature want to add + Extension

Class, enum,typedefs, extensions name should in UpperCamelCase

Maximum of code lines inside a UI file should not bigger than 300
Maximum of code lines inside a inner build function should not bigger than 30

##Tuple
We only use Tuple2 and Tuple3. Other than that, we should create an object.

// Don't
import 'package:demo/src/utils/dialog_utils.dart';
// Do
import '../../../utils/dialog_utils.dart';

//Don't
v = a == null ? b : a;
//Do
v = a ?? b;
//Don't
v = a == null ? null : a.b;
//Do
v = a?.b;

//Don't
(item as Animal).name = 'Lion';

//Do
if (item is Animal)
  item.name = 'Lion';

//Don't
var s = 'This is demo string \\ and \$';

//Do
var s = r'This is demo string \ and $';

//Don't
get width {
  return right - left;
}

//Do
get width => right - left;

Rules:
- always_declare_return_types
- always_put_control_body_on_new_line
- always_require_non_null_named_parameters
- annotate_overrides
- await_only_futures
- cancel_subscriptions
- sized_box_for_whitespace
- prefer_final_fields
- prefer_final_in_for_each
- prefer_final_locals
- unnecessary_await_in_return

To run app, you will need to create a environments folder and have dev.env

example/
  pubspec.yaml
  README.md << This readme
  environments/ << create this folder
    dev.env
    prod.env
    stag.env
  lib/
```

The content of this file looks like this:

```json
{
  "baseUrl": "https://.....",
}
```

Version flutter: sdk: ">=2.16.2 <3.0.0"