<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laratrust\Traits\LaratrustUserTrait;
use Illuminate\Notifications\Notifiable;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;

class Doctor extends Model
{
    use LaratrustUserTrait;
    use Notifiable;

    protected $guarded = [];


    protected $fillable = [
        'name',
        'username',
        'email',
        'password',
        'phone',
        'active',
        'account_confirm'
    ];

    /*protected $casts = [
        'phone' => 'array'
    ];*/


    protected $hidden = [
        'password', 'remember_token',
    ];

    public function subjects(){
        return $this->hasMany(Subject::class, 'doc_id');
    }

    public function lessons(){
        return $this->hasMany(Lesson::class, 'doc_id');
    }
    public function assignments(){
        return $this->hasMany(Assignment::class, 'doc_id');
    }


    public function dataTable($query)
    {
        return datatables()
            ->eloquent($query);
    }

    public function html()
    {
                return $this->builder()
                ->columns($this->getColumns())
                ->minifiedAjax()
                ->orderBy(1)
                ->parameters([
                    'dom'          => 'Bfrtip',
                    'buttons'      => ['excel', 'csv'],
                ]);
                    // ->buttons(
                    //     Button::make('csv'),
                    //     Button::make('excel')
                    // );
    }
    protected function getColumns()
    {
        return [
            Column::make('id'),
            Column::make('name'),
            Column::make('email'),
        ];
    }
}
