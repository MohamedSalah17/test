<!DOCTYPE html>
<html dir="{{ LaravelLocalization::getCurrentLocaleDirection() }}">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>@lang('site.hioac')</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!--bootstrap-->
    {{-- <link rel="stylesheet" href="{{ asset('dashboard/css/bootstrap.min.css') }}"> --}}
    <link rel="stylesheet" href="{{ asset('dashboard/datatable/bootstrap.min.css') }}">
    {{-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> --}}
    <link rel="stylesheet" href="{{ asset('dashboard/css/ionicons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('dashboard/css/skin-blue.min.css') }}">
    <link rel="stylesheet" href="{{ asset('dashboard/datatable/dataTables.bootstrap.min.css') }}">
    {{-- <link rel="stylesheet" href="{{ asset('dashboard/datatable/dataTables.material.min.css') }}"> --}}
    {{-- <link rel="stylesheet" href="{{ asset('dashboard/datatable/bootstrap.min.css') }}"> --}}
    {{-- <link rel="stylesheet" href="{{ asset('dashboard/datatable/buttons.dataTables.min.css') }}"> --}}

  <!-- Theme style -->


  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
        @if (app()->getLocale() == 'ar')
          <link rel="stylesheet" href="{{ asset('dashboard/css/font-awesome-rtl.min.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/AdminLTE-RTL.min.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/fontcairo.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/bootstrap-rtl.min.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/rtl.css') }}">

          <style>
            body, h1, h2, h3, h4, h5, h6{
              font-family: 'Cairo', sans-serif !important;
            }
          </style>
        @else
          <link rel="stylesheet" href="{{ asset('dashboard/css/AdminLTE.min.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/font-awesome.min.css') }}">
          <link rel="stylesheet" href="{{ asset('dashboard/css/fontbasic.css') }}">
        @endif

        <style>
            .mr-2{
                margin-right: 5px;
            }
            .mt-2{
                margin-top: 5px;
            }

            .loader {
                border: 5px solid #f3f3f3;
                border-radius: 50%;
                border-top: 5px solid #367FA9;
                width: 60px;
                height: 60px;
                -webkit-animation: spin 1s linear infinite; /* Safari */
                animation: spin 1s linear infinite;
            }
            select{
                padding: 2px 12px !important;
            }

            /* Safari */
            @-webkit-keyframes spin {
                0% {
                    -webkit-transform: rotate(0deg);
                }
                100% {
                    -webkit-transform: rotate(360deg);
                }
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .pdfobject-container {
                width: 800px;
                margin: 30px auto;
            }
            #viewpdf{
                width: 100%;
                height: 400px;
                border: 1px solid rgb(0, 0, .2);
            }


        </style>

        <script src="{{ asset('dashboard/js/jquery.min.js')}}"></script>

        <link rel="stylesheet" href=" {{ asset('dashboard/plugins/noty/noty.css')}}">
        <script src="{{ asset('dashboard/plugins/noty/noty.min.js')}}"></script>

        <link rel="stylesheet" href="{{ asset('dashboard/plugins/icheck/all.css')}}">

        {{--morris--}}
        <link rel="stylesheet" href="{{ asset('dashboard/plugins/morris/morris.css') }}">

        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <!-- User Image -->
                      <img src="{{ asset('dashboard/img/avatar5.png') }}" class="img-circle" alt="User Image">
                      </div>
                      <!-- Message title and timestamp -->
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- The message -->
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
                <!-- /.menu -->
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger"></span>
            </a>
            <ul class="dropdown-menu">
              <li>
                <!-- Inner menu: contains the langs -->
                <ul class="menu">
                    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                        <li>
                            <a rel="alternate" hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                                {{ $properties['native'] }}
                            </a>
                        </li>
                    @endforeach
                  <!-- end task item -->
                </ul>
              </li>

            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="{{ asset('dashboard/img/avatar5.png') }}" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">{{ auth()->user()->name }} {{--auth()->user()->last_name--}}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="{{ asset('dashboard/img/avatar5.png') }} " class="img-circle" alt="User Image">

                <p>
                  {{ auth()->user()->name }} {{--auth()->user()->last_name--}} - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->

              <!-- Menu Footer-->
              <li class="user-footer">


                <a href="{{ route('logout') }}" class="btn btn-default btn-flat" onclick="event.preventDefault();
                                 document.getElementById('logout-form').submit();">@lang('site.logout')</a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>

            </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
         </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->

  <!-- /.content-wrapper -->
    @include('layouts.dashboard._aside')
    @yield('content')
    @include('partials._session')

  <!-- Main Footer -->
  {{--<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">

    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>--}}

  <!-- Control Sidebar -->

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->

      <!-- Bootstrap 3.3.7 -->
      <script src="{{ asset('dashboard/js/bootstrap.min.js')}}"></script>
      <script src="{{ asset('dashboard/js/jquery.min.js')}}"></script>
      {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> --}}

      {{-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> --}}
      <script src="{{ asset('dashboard/js/bootstrap.bundle.min.js')}}"></script>
      <script src="{{ asset('dashboard/datatable/jquery.dataTables.min.js')}}"></script>
            <script src="{{ asset('dashboard/datatable/dataTables.bootstrap4.min.js')}}"></script>
      {{-- <script src="{{ asset('dashboard/datatable/jquery.dataTables.min_1.js')}}"></script> --}}

       <!-- AdminLTE App -->
      <script src="{{ asset('dashboard/js/adminlte.min.js')}}"></script>
      <script src="{{ asset('dashboard/js/fastclick.js')}}"></script>
       {{--icheck--}}
      <script src="{{ asset('dashboard/plugins/icheck/icheck.min.js') }}"></script>
      <script src="{{ asset('dashboard/plugins/ckeditor/ckeditor.js') }}"></script>
        {{--jquery number--}}
      <script src="{{ asset('dashboard/js/jquery.number.min.js') }}"></script>

      {{--print this--}}
      <script src="{{ asset('dashboard/js/printThis.js') }}"></script>

      {{--custom--}}
      <script src="{{ asset('dashboard/js/custom/order.js')}}"></script>
      <script src="{{ asset('dashboard/js/custom/image_preview.js')}}"></script>

    {{--morris --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="{{ asset('dashboard/plugins/morris/morris.min.js') }}"></script>


<script>

    $(document).ready(function () {
        $('.sidebar-menu').tree();

        $('#table').DataTable({
         "pageLength": 10,

        });

        //icheck
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });

        //delete
        $('.delete').click(function (e) {
            var that = $(this)
            e.preventDefault();
            var n = new Noty({
                text: "@lang('site.confirm_delete')",
                type: "warning",
                killer: true,
                buttons: [
                    Noty.button("@lang('site.yes')", 'btn btn-success mr-2', function () {
                        that.closest('form').submit();
                    }) ,

                     Noty.button("@lang('site.no')", 'btn btn-primary mr-2', function () {
                        n.close();
                    })
                ]
            });
            n.show();
        });//end of delete


        CKEDITOR.config.language = "{{ app()->getLocale() }}";//to change the direction of textearea of description by change the language


    });//end of ready


</script>

@yield('scripts')

</body>
</html>
