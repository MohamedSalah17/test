@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.lessons')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.lessons.index')}}">@lang('site.lessons')</a></li>
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
                        <form action="{{route('dashboard.lessons.update', $lesson->id)}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('put') }}


                            <div class="form-group">
                                <label>@lang('site.name')</label>
                                <input type="text" name="name" class="form-control" value="{{ $lesson->name }}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.code')</label>
                                <input type="text" name="code" class="form-control" value="{{ $lesson->code }}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.subjects')</label>
                                <select name="sbj_id" class="form-control">
                                    <option value="">@lang('site.all_subjects')</option>
                                    @foreach ($subjects as $subject)
                                        <option value="{{$subject->id}}" {{$lesson->sbj_id == $subject->id ? 'selected' : ''}}>{{$subject->name}}</option>
                                    @endforeach
                                </select>
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
