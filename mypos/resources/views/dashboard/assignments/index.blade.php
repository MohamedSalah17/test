@extends('layouts.dashboard.app')

@section('content')

    <div class="content-wrapper">
            <section class="content-header">
                <h1>@lang('site.assignments')</h1>
                <ol class="breadcrumb">
                <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a></li>
                    <li class="active"> @lang('site.assignments')</li>
                </ol>
            </section>
            <section class="content">

                <div class="box box-primary">

                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-bottom: 15px">@lang('site.assignments') <small>{{$assignments->total()}}</small></h3>
                        <form action="{{ route('dashboard.assignments.index')}}" method="GET">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" name="search" class="form-control" placeholder="@lang('site.search')" value="{{ request()->search}}">
                                </div>

                                <div class="col-md-4">
                                    <select name="doc_id" class="form-control">
                                        <option value="">@lang('site.lessons')</option>
                                        @foreach ($lessons as $lesson)
                                            <option value="{{$lesson->id}}" {{request()->doc_id == $lesson->id ? 'selected' : ''}}>{{$lesson->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> @lang('site.search')</button>

                                    @if (auth()->user()->hasPermission('create_assignments'))
                                        <a href=" {{route('dashboard.assignments.create')}}" class="btn btn-success"><i class="fa fa-plus"></i> @lang('site.add')</a>
                                    @endif


                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="box-body">
                        @if ($assignments->count() > 0)
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>@lang('site.name')</th>
                                        <th>@lang('site.code')</th>
                                        <th>@lang('site.sbj_doc')</th>
                                        <th> </th>
                                        <th>@lang('site.action')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($assignments as $index=>$assignment)
                                    <tr>
                                        <td>{{ $index + 1}}</td>
                                        <td>{{ $assignment->name}}</td>
                                        <td>{{ $assignment->code}}</td>
                                        <td>{{ $assignment->lesson['name']}}</td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sbjTable">@lang('site.show_subj_table')</button>
                                            {{--<a href="{{ asset('dashboard/files/myposProject.pdf') }}">@lang('site.show_subj_table')</a>--}}
                                        </td>
                                        <td>
                                            @if (auth()->user()->hasPermission('update_assignments'))
                                                <a href=" {{ route('dashboard.assignments.edit', $assignment->id)}}" class="btn btn-info btn-sm"><i class="fa fa-edit"></i> @lang('site.edit')</a>
                                            @endif
                                            @if (auth()->user()->hasPermission('delete_assignments'))
                                                <form action="{{route('dashboard.assignments.destroy', $assignment->id)}}" method="POST" style="display: inline-block">
                                                    {{ csrf_field() }}
                                                    {{ method_field('delete')}}
                                                    <button type="submit" class="btn btn-danger delete btn-sm"><i class="fa fa-trash"></i> @lang('site.delete')</button>
                                                </form>
                                            @endif

                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{$assignments->appends(request()->query())->links()}}
                        @else
                            <h2>@lang('site.no_data_found')</h2>
                        @endif
                    </div>

                </div>

            </section>

    </div>

    {{--model dailog--}}


    <!-- Modal -->
    <div class="modal fade" id="sbjTable" role="dialog">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title text-center">@lang('site.sbj_table')</h4>
            </div>
            <div class="modal-body">
                <div class="pdfobject-container">
                    <div id="viewpdf"></div>
                </div>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>

@endsection

