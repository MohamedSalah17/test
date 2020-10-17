@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.students')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.students.index')}}">@lang('site.students')</a></li>
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
                        <form action="{{route('dashboard.students.update', $student->id)}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('put') }}

                            <div class="form-group">
                                <label>@lang('site.name') *</label>
                                <input type="text" name="name" class="form-control" value="{{$student->name}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.username')*</label>
                                <input type="text" name="username" class="form-control" value="{{$student->username}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.code') *</label>
                                <input type="text" name="code" class="form-control" value="{{$student->code}}">
                            </div>


                            <div class="form-group">
                                <label>@lang('site.email') *</label>
                                <input type="email" name="email" class="form-control" value="{{$student->email}}">
                            </div>


                            <div class="form-group">
                                <label>@lang('site.phone')*</label>
                                <input type="text" name="phone" class="form-control" value="{{$student->phone}}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.address') *</label>
                                <textarea name="address" class="form-control">{{$student->address}}</textarea>
                            </div>




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
