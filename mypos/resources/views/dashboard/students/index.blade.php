@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
            <section class="content-header">
                <h1>@lang('site.students')</h1>
                <ol class="breadcrumb">
                <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li class="active"> @lang('site.students')</li>
                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-bottom: 15px">@lang('site.students') <small>{{--$students->total()--}}</small></h3>
                        <form action="{{ route('dashboard.students.index')}}" method="GET">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" name="search" class="form-control" placeholder="@lang('site.search')" value="{{ request()->search}}">
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> @lang('site.search')</button>

                                    @if (auth()->user()->hasPermission('create_students'))
                                        <a href=" {{route('dashboard.students.create')}}" class="btn btn-success"><i class="fa fa-plus"></i> @lang('site.add')</a>
                                    @else
                                        <a href="#" class="btn btn-success disabled"><i class="fa fa-plus"></i> @lang('site.add')</a>
                                    @endif
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="box-body">
                        @if ($students->count() > 0)
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>@lang('site.first_name')</th>
                                        <th>@lang('site.last_name')</th>
                                        <th>@lang('site.email')</th>
                                        <th>@lang('site.image')</th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($students as $index=>$student)
                                    <tr>
                                        <td>{{ $index + 1}}</td>
                                        <td>{{ $student->first_name}}</td>
                                        <td>{{ $student->last_name}}</td>
                                        <td>{{ $student->email}}</td>
                                        <td><img src="{{ $student->image_path }}" style="width: 80px;" class="img-thumbnail" alt=""></td>
                                        <td>
                                            @if (auth()->user()->hasPermission('update_students'))
                                                <a href=" {{ route('dashboard.students.edit', $student->id)}}" class="btn btn-info btn-sm"><i class="fa fa-edit"></i> @lang('site.edit')</a>
                                            @else
                                                <a href="#" class="btn btn-info btn-sm disabled"><i class="fa fa-edit"></i> @lang('site.edit')</a>
                                            @endif
                                            @if (auth()->user()->hasPermission('delete_students'))
                                                <form action="{{route('dashboard.students.destroy', $student->id)}}" method="POST" style="display: inline-block">
                                                    {{ csrf_field() }}
                                                    {{ method_field('delete')}}
                                                    <button type="submit" class="btn btn-danger delete btn-sm"><i class="fa fa-trash"></i> @lang('site.delete')</button>
                                                </form>
                                            @else
                                                <button class="btn btn-danger disabled"><i class="fa fa-trash"></i> @lang('site.delete')</button>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $students->appends(request()->query())->links() }}
                        @else
                            <h2>@lang('site.no_data_found')</h2>
                        @endif
                    </div>

                </div>

            </section>

    </div>

@endsection
