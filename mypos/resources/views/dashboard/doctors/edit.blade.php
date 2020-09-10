@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.doctors')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.doctors.index')}}">@lang('site.doctors')</a></li>
                    <li class="active">@lang('site.edit')</li>

                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header">
                        <h3 class="box-title">@lang('site.edit')</h3>
                    </div>

                    <div class="box-body">
                        @include('partials._errors')
                        <form action="{{route('dashboard.doctors.update', $doctor->id)}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('put') }}

                            <div class="form-group">
                                <label>@lang('site.four_name')</label>
                                <input type="text" name="four_name" class="form-control" value="{{$doctor->four_name}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.std_code')</label>
                                <input type="text" name="std_code" class="form-control" value="{{$doctor->std_code}}">
                            </div>


                            <div class="form-group">
                                <label>@lang('site.email')</label>
                                <input type="email" name="email" class="form-control" value="{{$doctor->email}}">
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
                                <input type="text" name="phone[]" class="form-control" value="{{$doctor->phone}}">
                            </div>
                            @endfor

                            <div class="form-group">
                                <label>@lang('site.address')</label>
                                <textarea name="address" class="form-control">{{$doctor->address}}</textarea>
                            </div>

                            <div class="form-group">
                                <label>@lang('site.image')</label>
                                <input type="file" name="image" class="form-control image">
                            </div>

                            <div class="form-group">
                            <img src="{{ asset('uploads/user_images/default.png')}}" style="width: 100px" class="img-thumbnail image-preview" alt="">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.permissions')</label>
                                <!-- Custom Tabs -->
                                <div class="nav-tabs-custom">
                                    @php
                                        $models = ['doctors', 'categories', 'products', 'clients', 'orders'];
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
                                                    <label><input type="checkbox" name="permissions[]" {{ $user->hasPermission($map .'_'. $model) ? 'checked' : '' }} value="{{$map .'_'. $model}}"> @lang('site.' .$map) </label>
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
                                <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i> @lang('site.edit')</button>
                            </div>
                        </form>
                    </div><!--end of box-body-->

                </div>

            </section>
        </section>


    </div>

@endsection
