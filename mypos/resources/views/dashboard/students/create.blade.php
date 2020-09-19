@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.students')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.students.index')}}">@lang('site.students')</a></li>
                    <li class="active">@lang('site.add')</li>

                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header">
                        <h3 class="box-title">@lang('site.add')</h3>
                    </div>

                    <div class="box-body">
                        @include('partials._errors')
                        <form action="{{route('dashboard.students.store')}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('post') }}

                            <div class="form-group">
                                <label>@lang('site.name')</label>
                                <input type="text" name="name" class="form-control" value="{{old('name')}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.code')</label>
                                <input type="text" name="code" class="form-control" value="{{old('code')}}">
                            </div>


                            <div class="form-group">
                                <label>@lang('site.email')</label>
                                <input type="email" name="email" class="form-control" value="{{old('email')}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.password')</label>
                                <input type="password" name="password" class="form-control">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.password_confirmation')</label>
                                <input type="password" name="password_confirmation" class="form-control">
                            </div>

                            @for ($i = 0; $i < 2; $i++)
                            <div class="form-group">
                                <label>@lang('site.phone')</label>
                                <input type="text" name="phone[]" class="form-control">
                            </div>
                            @endfor

                            <div class="form-group">
                                <label>@lang('site.address')</label>
                                <textarea name="address" class="form-control">{{old('address')}}</textarea>
                            </div>



                            <div class="form-group">
                                <label>@lang('site.permissions')</label>
                                <!-- Custom Tabs -->
                                <div class="nav-tabs-custom">
                                    @php
                                        $models = ['admins', 'doctors', 'students', 'subjects','lessons', 'assignments','regist','stdassign'];
                                        $maps   = ['create', 'read', 'update', 'delete'];
                                    @endphp
                                    <ul class="nav nav-tabs">
                                        @foreach ($models as $index=>$model)
                                            <li class="{{ $index == 0? 'active' : ''}}"><a href="#{{$model}}" data-toggle="tab">@lang('site.' .$model)</a></li>
                                        @endforeach
                                    </ul>
                                    <div class="tab-content">
                                        @foreach ($models as $index=>$model)
                                            <div class="tab-pane {{ $index == 0? 'active' : ''}}" id="{{$model}}">
                                                @foreach ($maps as $map)
                                                    <label><input type="checkbox" name="permissions[]" value="{{$map. '_' .$model}}"> @lang('site.' .$map) </label>
                                                @endforeach
                                            </div>
                                            <!-- /.tab-pane -->
                                        @endforeach
                                    </div>
                                    <!-- /.tab-content -->
                                </div>
                            <!-- nav-tabs-custom -->
                            </div><!--end of form group-->



                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add')</button>
                            </div>
                        </form>
                    </div><!--end of box-body-->

                </div>

            </section>
        </section>


    </div>

@endsection
