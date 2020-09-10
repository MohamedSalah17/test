@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
        <section class="content container-fluid">
            <section class="content-header">
                <h1>@lang('site.subjects')</h1>
                <ol class="breadcrumb">
                    <li><a href=" {{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li> <a href=" {{route('dashboard.subjects.index')}}">@lang('site.subjects')</a></li>
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
                        <form action="{{route('dashboard.subjects.update', $subject->id)}}" method="POST" enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('put') }}


                            <div class="form-group">
                                <label>@lang('site.sbj_name')</label>
                                <input type="text" name="sbj_name" class="form-control" value="{{ $subject->sbj_name }}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.sbj_code')</label>
                                <input type="text" name="sbj_code" class="form-control" value="{{ $subject->sbj_code }}">
                            </div>

                            <div class="form-group">
                                <label>@lang('site.sbj_doc')</label>
                                <input type="text" name="sbj_doc" class="form-control" value="{{ $subject->sbj_doc }}">
                            </div>


                            <div class="form-group">
                                <label>@lang('site.subj_stds')</label>
                                <input type="file" name="subj_stds" class="form-control" value="{{ $subject->subj_stds }}">
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
