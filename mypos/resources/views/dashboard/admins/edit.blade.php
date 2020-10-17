@extends('layouts.dashboard.app')

@section('content')


    <div class="content-wrapper">
        <section class="content-header">

            <h1>@lang('site.admins')
            </h1>

            <ol class="breadcrumb">
                <li><a href="{{route('dashboard.index')}}"><i class="fa fa-dashboard"></i>@lang('site.dashboard')</a></li>
                <li><a href="{{route('dashboard.admins.index')}}">@lang('site.admins')</a></li>
                <li>@lang('site.edit')</li>
            </ol>

        </section>

        <section class="content">

            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">@lang('site.edit')</h3>
                </div>

                <div class="box-body">
                    @include('partials._errors')
                    <form action="{{route('dashboard.admins.update', $admin->id)}}" method="post">
                        {{csrf_field()}}
                        {{ method_field('put') }}
                        <div class="form-group">
                            <label>@lang('site.name')</label>
                            <input type="text" name="name" class="form-control" value="{{ $admin->name }} ">
                        </div>

                        <div class="form-group">
                            <label>@lang('site.username')*</label>
                            <input type="text" name="username" class="form-control" value="{{$admin->username}}">
                        </div>

                        <div class="form-group">
                            <label>@lang('site.phone')*</label>
                            <input type="text" name="phone" class="form-control" value="{{$admin->phone}}">
                        </div>

                        {{--<div class="form-group">
                            <label>@lang('site.last_name')</label>
                            <input type="text" name="last_name" class="form-control" value="{{ $admin->last_name }} ">
                        </div>--}}

                        <div class="form-group">
                            <label>@lang('site.email')</label>
                            <input type="email" name="email" class="form-control" value="{{ $admin->email }} ">
                        </div>




                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i> @lang('site.edit')</button>
                        </div>


                    </form><!-- end of form -->
                </div><!-- end of box body -->
            </div>
        </section>
    </div>
@endsection
