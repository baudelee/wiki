* 指令详解
  指令可以理解成是在特定的DOM元素上运行的函数，指令可以扩展这个元素的功能。

angular.module('myApp', [])
  .directive('myDirective', function($timeout, UserDefinedService){
    //指令定义放在这里
  });

* directive()
  directive(name, factory_function)
  *name : 字符串，用来在视图中引用特定的指令
  *factory_function : 函数，这个函数返回一个对象，其中定义了指令的全部行为。$compile服务利用这个方法返回的对象，在DOM调用指令时来构造指令的行为。

  angular.module('myApp', [])
    .directive('myDirective', function(){
      //一个指令定义对象
      return {
        // 通过设置项来定义指令，在这里进行覆写
      };
    });

angular.module('myApp', [])
  .directive('myDirective', function(){
    return {
      restrict: String,
      priority: Number,
      terminal: Boolean,
      template: String or Template Function:
        function(tElement, tAttrs)(...},
      tempalteUrl: String,
      replace: Boolean or String,
      scope: Boolean or Object,
      transclude: Boolean,
      controller: String or function(scope, element, attrs, transclude, otherInjectables{...},
      controllerAs: String,
      require: String,
      link: function(scope, iElement, iAttrs({...},
      compile: // 返回一个对象或链接函数，如下所示：
        function(tElement, tAttrs, transclude){
	  return {
	    pre: function(scope, iElement, iAttrs, controller){...},
	    post: function(scope, iElement, iAttrs, controller){...}
	  }
	  // 或者
	  return function postlink(...){...}
	}
    };
  });

* restrict
  是一个可选参数。告诉AngularJS这个指令在DOM中可以以何种形式被声明。默认值为A

  E(元素)
    <my-directive></my-directive>
  A(属性，默认值)
    <div my-directive="expression"></div>
  C(类名)
    <div class="my-directive:expression;"></div>
  M(注释)
    <--directive:my-directive expression-->

* terminal 布尔值
  true or false
  这个参数用来告诉AngularJS停止运行当前元素上比本指令优先级低的指令。
  使用了terminal参数的例子就是ngView和ngIf。ngIf优先级高于ngView。如果ngIf为true，则ngView会正常执行；如果ngIf为false，则ngView不会被执行。

* template 字符串或函数
  template参数是可选的，必须被设置为以下两种形式之一：
    一段HTML文本；
    一个可以接受两个参数的函数，参数为tElement和tAttrs,并返回一个代表模板的字符串。tElement和tAttrs中的t代表template，是相对于instance的。

* templateUrl 字符串或函数
  templateUrl是可选参数，可以是以下类型：
    @一个代表外部HTML文件路径的字符串
    @一个可以接受两个参数的函数，参数为tElement和tAttrs,并返回一个外部HTML文件路径的字符串
    @
